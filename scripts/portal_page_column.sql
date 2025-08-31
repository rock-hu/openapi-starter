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
-- Name: portal_page_column; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE portal_page_column (
    portal_page_id character varying(20) NOT NULL,
    column_seq_id character varying(20) NOT NULL,
    column_width_pixels numeric(20,0),
    column_width_percentage numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.portal_page_column OWNER TO ofbiz;

--
-- Name: portal_page_column pk_portal_page_column; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page_column
    ADD CONSTRAINT pk_portal_page_column PRIMARY KEY (portal_page_id, column_seq_id);


--
-- Name: prtl_pg_cln_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtl_pg_cln_txcrts ON portal_page_column USING btree (created_tx_stamp);


--
-- Name: prtl_pg_cln_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtl_pg_cln_txstmp ON portal_page_column USING btree (last_updated_tx_stamp);


--
-- Name: prtl_pgcol_page; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtl_pgcol_page ON portal_page_column USING btree (portal_page_id);


--
-- Name: portal_page_column prtl_pgcol_page; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page_column
    ADD CONSTRAINT prtl_pgcol_page FOREIGN KEY (portal_page_id) REFERENCES portal_page(portal_page_id);


--
-- PostgreSQL database dump complete
--

