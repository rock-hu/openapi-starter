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
-- Name: product_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_role (
    product_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_role OWNER TO ofbiz;

--
-- Name: product_role pk_product_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_role
    ADD CONSTRAINT pk_product_role PRIMARY KEY (product_id, party_id, role_type_id, from_date);


--
-- Name: prdct_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_rl_txcrts ON product_role USING btree (created_tx_stamp);


--
-- Name: prdct_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_rl_txstmp ON product_role USING btree (last_updated_tx_stamp);


--
-- Name: prod_rle_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_rle_product ON product_role USING btree (product_id);


--
-- Name: prod_rle_ptyrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_rle_ptyrle ON product_role USING btree (party_id, role_type_id);


--
-- Name: product_role prod_rle_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_role
    ADD CONSTRAINT prod_rle_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_role prod_rle_ptyrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_role
    ADD CONSTRAINT prod_rle_ptyrle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

