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
-- Name: prod_catalog_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE prod_catalog_role (
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    prod_catalog_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.prod_catalog_role OWNER TO ofbiz;

--
-- Name: prod_catalog_role pk_prod_catalog_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_role
    ADD CONSTRAINT pk_prod_catalog_role PRIMARY KEY (party_id, role_type_id, prod_catalog_id, from_date);


--
-- Name: pcatrle_catalog; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcatrle_catalog ON prod_catalog_role USING btree (prod_catalog_id);


--
-- Name: pcatrle_ptyrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcatrle_ptyrle ON prod_catalog_role USING btree (party_id, role_type_id);


--
-- Name: prd_ctlg_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctlg_rl_txcrts ON prod_catalog_role USING btree (created_tx_stamp);


--
-- Name: prd_ctlg_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctlg_rl_txstmp ON prod_catalog_role USING btree (last_updated_tx_stamp);


--
-- Name: prod_catalog_role pcatrle_catalog; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_role
    ADD CONSTRAINT pcatrle_catalog FOREIGN KEY (prod_catalog_id) REFERENCES prod_catalog(prod_catalog_id);


--
-- Name: prod_catalog_role pcatrle_ptyrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_role
    ADD CONSTRAINT pcatrle_ptyrle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

