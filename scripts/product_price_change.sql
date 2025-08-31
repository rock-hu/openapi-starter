--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: product_price_change; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_price_change (
    product_price_change_id character varying(20) NOT NULL,
    product_id character varying(20),
    product_price_type_id character varying(20),
    product_price_purpose_id character varying(20),
    currency_uom_id character varying(20),
    product_store_group_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    price numeric(18,2),
    old_price numeric(18,2),
    changed_date timestamp with time zone,
    changed_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_price_change OWNER TO ofbiz;

--
-- Name: product_price_change pk_product_price_change; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_change
    ADD CONSTRAINT pk_product_price_change PRIMARY KEY (product_price_change_id);


--
-- Name: prdt_prc_chg_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prc_chg_txcrs ON product_price_change USING btree (created_tx_stamp);


--
-- Name: prdt_prc_chg_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prc_chg_txstp ON product_price_change USING btree (last_updated_tx_stamp);


--
-- Name: prod_prchng_chul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prchng_chul ON product_price_change USING btree (changed_by_user_login);


--
-- Name: product_price_change prod_prchng_chul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_change
    ADD CONSTRAINT prod_prchng_chul FOREIGN KEY (changed_by_user_login) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

