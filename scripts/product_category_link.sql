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
-- Name: product_category_link; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_category_link (
    product_category_id character varying(20) NOT NULL,
    link_seq_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    comments character varying(255),
    sequence_num numeric(20,0),
    title_text character varying(255),
    detail_text text,
    image_url character varying(2000),
    image_two_url character varying(2000),
    link_type_enum_id character varying(20),
    link_info character varying(255),
    detail_sub_screen character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_category_link OWNER TO ofbiz;

--
-- Name: product_category_link pk_product_category_link; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_link
    ADD CONSTRAINT pk_product_category_link PRIMARY KEY (product_category_id, link_seq_id, from_date);


--
-- Name: prdt_ctr_lnk_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_lnk_txcrs ON product_category_link USING btree (created_tx_stamp);


--
-- Name: prdt_ctr_lnk_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_lnk_txstp ON product_category_link USING btree (last_updated_tx_stamp);


--
-- Name: prod_clnk_category; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_clnk_category ON product_category_link USING btree (product_category_id);


--
-- Name: prod_clnk_lktpenm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_clnk_lktpenm ON product_category_link USING btree (link_type_enum_id);


--
-- Name: product_category_link prod_clnk_category; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_link
    ADD CONSTRAINT prod_clnk_category FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_category_link prod_clnk_lktpenm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_link
    ADD CONSTRAINT prod_clnk_lktpenm FOREIGN KEY (link_type_enum_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

